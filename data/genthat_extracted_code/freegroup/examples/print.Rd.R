library(freegroup)


### Name: print
### Title: Print free objects
### Aliases: print.free as.character_free

### ** Examples


## default symbols:

abc(26)
rfree(1,10)


# if we need more than 26:
options(symbols=state.name)
rfree(10,4)

# or even:
jj <- letters[1:10]
options(symbols=apply(expand.grid(jj,jj),1,paste,collapse=""))
rfree(10,10,100,4)

options(symbols=NULL)  #  NULL is interpreted as letters a-z
rfree(10,4)            #  back to normal



