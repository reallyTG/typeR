library(RcppGetconf)


### Name: getAll
### Title: Return all System Configuration Settings
### Aliases: getAll

### ** Examples

if (Sys.info()[["sysname"]] != "SunOS") {
    head(getAll(), 30)
    subset(getAll(), type=="path")
}



