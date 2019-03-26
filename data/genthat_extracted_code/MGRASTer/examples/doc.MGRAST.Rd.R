library(MGRASTer)


### Name: doc.MGRAST
### Title: Documentation for MG-RAST API
### Aliases: doc.MGRAST

### ** Examples

##  list resources, then list all requests of all resources
doc.MGRAST()
doc.MGRAST(2)

##  show detail for matrix resource (partial matching works)
doc.MGRAST (head="matrix")
doc.MGRAST (2, head="mat")

##  show options for all requests
doc.MGRAST (stratum="options")
doc.MGRAST (2, "options")

##  show options in detail for a specific request
doc.MGRAST (3, head=c("annot","seq","param","opt"))

##  show return values of all m5nr requests in detail
doc.MGRAST (5, "attributes.data", "m5nr", nchar.max=30)



