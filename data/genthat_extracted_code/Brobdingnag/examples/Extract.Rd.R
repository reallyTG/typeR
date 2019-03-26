library(Brobdingnag)


### Name: Extract.brob
### Title: Extract or Replace Parts of brobs or glubs
### Aliases: [.brob [<-.brob [.glub [<-.glub [,brob-method [<-,brob-method
###   [,glub-method [<-,glub-method
### Keywords: math

### ** Examples

a <- as.brob(10)^c(-100,0,100,1000,1e32)

a[4]

a[4] <- 1e100

a




