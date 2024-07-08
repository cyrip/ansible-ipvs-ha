# Makefile for managing Ansible tasks

# Variables
SETUP_PLAYBOOK = ha-setup.yml

# Ansible targets
.PHONY: all lint setup

all: lint bootstrap 

# Target to run the Ansible playbook
setup:
	ansible-playbook $(SETUP_PLAYBOOK) --become --become-method=sudo

# Target to lint the Ansible playbook
lint:
	ansible-lint $(SETUP_PLAYBOOK)

# Help target to display usage information
help:
	@echo "Makefile for managing Ansible tasks"
	@echo ""
	@echo "Usage:"
	@echo "  make setup  	 Bootstrap the nodes"
	@echo "  make lint       Lint the Ansible playbook with ansible-lint"
	@echo "  make help       Display this help message"
