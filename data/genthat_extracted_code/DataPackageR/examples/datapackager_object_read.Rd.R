library(DataPackageR)


### Name: datapackager_object_read
### Title: Read an object created in a previously run processing script.
### Aliases: datapackager_object_read

### ** Examples

if(rmarkdown::pandoc_available()){
ENVS <- new.env() # ENVS would be in the environment
                 # where the data processing is run. It is
                 # handled automatically by the package.
assign("find_me", 100, ENVS) #This is done automatically by DataPackageR

find_me <- datapackager_object_read("find_me") # This would appear in an Rmd processed by
                                    # DataPackageR to access the object named "find_me" created
                                    # by a previous script. "find_me" would also need to
                                    # appear in the objects property of config.yml
}



