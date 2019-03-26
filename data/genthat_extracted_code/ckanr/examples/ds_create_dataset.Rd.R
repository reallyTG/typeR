library(ckanr)


### Name: ds_create_dataset
### Title: Datastore - create a new resource on an existing dataset
### Aliases: ds_create_dataset

### ** Examples

## Not run: 
##D path <- system.file("examples", "actinidiaceae.csv", package = "ckanr")
##D ckanr_setup(url = "http://demo.ckan.org/", key = "my-demo-ckan-org-api-key")
##D ds_create_dataset(package_id='testingagain', name="mydata", path = path)
##D 
##D # Testing: see ?ckanr_setup to set test settings
##D ckanr_setup(test_url = "http://my-ckan.org/",
##D             test_key = "my-ckan-api-key",
##D             test_did="an-existing-package-id",
##D             test_rid="an-existing-resource-id")
##D ds_create_dataset(package_id=get_test_pid(), name="mydata",
##D                   path=system.file("examples",
##D                                    "actinidiaceae.csv",
##D                                    package = "ckanr"),
##D                   key = get_test_key(),
##D                   url = get_test_url())
## End(Not run)



