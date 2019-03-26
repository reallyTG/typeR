library(paramlink)


### Name: setModel
### Title: Set, change or display the model parameters for 'linkdat'
###   objects
### Aliases: setModel print.linkdat.model

### ** Examples


data(toyped)
x = linkdat(toyped)
x1 = setModel(x, model=1)
summary(x1)

# The shortcut 'model=1' above is equivalent to 
x2 = setModel(x, chrom='AUTOSOMAL', penetrances=c(0,1,1), dfreq=1e-5)
stopifnot(all.equal(x1, x2))

# X-linked recessive model:
y1 = setModel(x, model=4, dfreq=0.01)
summary(y1)

# Long version of the above:
y2 = setModel(x, chrom='X', penetrances=list(male=c(0,1), female=c(0,0,1)),
              dfreq=0.01)
stopifnot(all.equal(y1, y2))

stopifnot(all.equal(y1, setModel(x, y1$model)))




