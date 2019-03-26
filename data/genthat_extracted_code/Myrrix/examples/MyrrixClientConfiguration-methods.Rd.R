library(Myrrix)


### Name: MyrrixClientConfiguration-methods
### Title: Methods to apply on objects of class MyrrixClientConfiguration
### Aliases: getMyrrixOptions
###   getMyrrixOptions,MyrrixClientConfiguration-method
###   MyrrixClientConfiguration-methods setAllPartitionsSpecification
###   setAllPartitionsSpecification,MyrrixClientConfiguration,character-method
###   setContextPath
###   setContextPath,MyrrixClientConfiguration,character-method setHost
###   setHost,MyrrixClientConfiguration,character-method setKeystoreFile
###   setKeystoreFile,MyrrixClientConfiguration,character-method
###   setKeystorePassword
###   setKeystorePassword,MyrrixClientConfiguration,character-method
###   setPassword setPassword,MyrrixClientConfiguration,character-method
###   setPort setPort,MyrrixClientConfiguration,integer-method setSecure
###   setSecure,MyrrixClientConfiguration,logical-method setUserName
###   setUserName,MyrrixClientConfiguration,character-method

### ** Examples

myconfig <- new("MyrrixClientConfiguration")
getMyrrixOptions(myconfig)
setHost(myconfig, "myhostname")
setPort(myconfig, 20L)



