library(adegenet)


### Name: genind2genpop
### Title: Conversion from a genind to a genpop object
### Aliases: genind2genpop
### Keywords: classes manip multivariate

### ** Examples


## simple conversion
data(nancycats)
nancycats
catpop <- genind2genpop(nancycats)
catpop
summary(catpop)

## processing the @other slot
data(sim2pop)
sim2pop$other$foo <- letters
sim2pop
dim(sim2pop$other$xy) # matches the number of genotypes
sim2pop$other$foo # does not match the number of genotypes

obj <- genind2genpop(sim2pop, process.other=TRUE)
obj$other # the new xy is the populations' centre

pch <- as.numeric(pop(sim2pop))
col <- pop(sim2pop)
levels(col) <- c("blue","red")
col <- as.character(col)
plot(sim2pop$other$xy, pch=pch, col=col)
text(obj$other$xy, lab=row.names(obj$other$xy), col=c("blue","red"), cex=2, font=2)
## Not run: 
##D data(microbov)
##D strata(microbov) <- data.frame(other(microbov))
##D summary(genind2genpop(microbov)) # Conversion based on population factor
##D summary(genind2genpop(microbov, ~coun)) # Conversion based on country
##D summary(genind2genpop(microbov, ~coun/spe)) # Conversion based on country and species
##D 
## End(Not run)




