library(ckanr)


### Name: ckanr_setup
### Title: Configure default CKAN settings
### Aliases: ckanr_setup

### ** Examples

# CKAN users without admin/editor privileges could run:
ckanr_setup(url = "http://data.techno-science.ca/")

# Privileged CKAN editor/admin users can run:
ckanr_setup(url = "http://data.techno-science.ca/", key = "some-CKAN-API-key")

# ckanR developers/testers can run:
ckanr_setup(url = "http://data.techno-science.ca/", key = "some-CKAN-API-key",
           test_url = "http://test-ckan.gov/",test_key = "test-ckan-API-key",
           test_did = "test-ckan-dataset-id",test_rid = "test-ckan-resource-id",
           test_gid = "test-group-name", test_oid = "test-organzation-name",
           test_behaviour = "FAIL")

# Not specifying the default CKAN URL will reset the CKAN URL to its default
# "http://data.techno-science.ca/":
ckanr_setup()



