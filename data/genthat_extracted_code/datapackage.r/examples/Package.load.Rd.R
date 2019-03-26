library(datapackage.r)


### Name: Package.load
### Title: Instantiate 'Data Package' class
### Aliases: Package.load

### ** Examples


# Load local descriptor
descriptor <- system.file('extdata/dp1/datapackage.json', 
                         package = "datapackage.r")
dataPackage <- Package.load(descriptor)
dataPackage$descriptor


# Retrieve Package Descriptor
descriptor2 <- '{"resources": [{"name": "name", "data": ["data"]}]}'
dataPackage2 <- Package.load(descriptor2)
dataPackage2$descriptor


# Expand Resource Descriptor
descriptor3 <- helpers.from.json.to.list('{"resources": 
                                         [{"name": "name",
                                          "data": ["data"]}]}')
dataPackage3 <- Package.load(descriptor3)
dataPackage3$descriptor


# Add, Get and Remove Package Resources
descriptor4 <- helpers.from.json.to.list(
       system.file('extdata/dp1/datapackage.json', 
                     package = "datapackage.r"))
dataPackage4 <- Package.load(descriptor4)
resource4 <- dataPackage4$addResource(
        helpers.from.json.to.list('{"name": "name", "data": ["test"]}'))
dataPackage4$resources[[2]]$source


# Get resource
dataPackage4$getResource('name')


# Remove resource
dataPackage4$removeResource('name')
dataPackage4$getResource('name')


# Modify and Commit Data Package
descriptor5 <- helpers.from.json.to.list(
        '{"resources": [{"name": "name", "data": ["data"]}]}')
dataPackage5 <- Package.load(descriptor5)
dataPackage5$descriptor$resources[[1]]$name <- 'modified'


## Name did not modified.
dataPackage5$resources[[1]]$name


## Should commit the changes
dataPackage5$commit() # TRUE - successful commit 
dataPackage5$resources[[1]]$name




