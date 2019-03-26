library(varhandle)


### Name: rm.all.but
### Title: Remove all variables except those that you mention
### Aliases: rm.all.but
### Keywords: remove variables keep variables

### ** Examples

    # create some variable
    for(i in  names(iris)){
    	assign(i, iris[,i])
    }
    # see the list of variables
    ls()
    # remove every variable except Petal.Length, Petal.Width and i
    rm.all.but(c("Petal*", "i"))
    # see which variable are left
    ls()



