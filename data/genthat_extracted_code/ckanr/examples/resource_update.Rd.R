library(ckanr)


### Name: resource_update
### Title: Update a resource's file attachment
### Aliases: resource_update

### ** Examples

## Not run: 
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # Get file
##D path <- system.file("examples", "actinidiaceae.csv", package = "ckanr")
##D 
##D # Create package, then a resource within that package
##D (res <- package_create("newpackage3"))
##D (xx <- resource_create(package_id = res$id,
##D                        description = "my resource",
##D                        name = "bears",
##D                        upload = path,
##D                        rcurl = "http://google.com"
##D ))
##D 
##D # Modify dataset, here lowercase strings in one column
##D dat <- read.csv(path, stringsAsFactors = FALSE)
##D dat$Family <- tolower(dat$Family)
##D newpath <- tempfile(fileext = ".csv")
##D write.csv(dat, file = newpath, row.names = FALSE)
##D 
##D # Upload modified dataset
##D ## Directly from output of resource_create
##D resource_update(xx, path=newpath)
##D 
##D ## or from the resource id
##D resource_update(xx$id, path=newpath)
##D 
##D #######
##D # Using default settings
##D ckanr_setup(url = "http://demo.ckan.org/", key = "my-demo-ckan-org-api-key")
##D path <- system.file("examples", "actinidiaceae.csv", package = "ckanr")
##D resource_update(id="an-existing-resource-id", path = path)
##D 
##D # Using an R object written to a tempfile, and implicit CKAN URL and API key
##D write.csv(data <- installed.packages(), path <- tempfile(fileext = ".csv"))
##D ckanr_setup(url = "http://demo.ckan.org/", key = "my-demo-ckan-org-api-key")
##D resource_update(id="an-existing-resource-id", path = path)
##D 
##D # Testing: see ?ckanr_setup to set default test CKAN url, key, package id
##D ckanr_setup(test_url = "http://my-ckan.org/",
##D             test_key = "my-ckan-api-key",
##D             test_did = "an-existing-package-id",
##D             test_rid = "an-existing-resource-id")
##D resource_update(id = get_test_rid(),
##D                 path = system.file("examples",
##D                                    "actinidiaceae.csv",
##D                                    package = "ckanr"),
##D                 key = get_test_key(),
##D                 url = get_test_url())
## End(Not run)



