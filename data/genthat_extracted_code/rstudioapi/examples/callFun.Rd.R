library(rstudioapi)


### Name: callFun
### Title: Call an RStudio API function
### Aliases: callFun

### ** Examples

if (rstudioapi::isAvailable()) {
  rstudioapi::callFun("versionInfo")
}



