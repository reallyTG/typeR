library(ibdreg)


### Name: sim.ibd.var
### Title: Create an ibd.var object via simulations using gene-dropping
### Aliases: sim.ibd.var

### ** Examples

## See manual(s) for full example usage
## Below is a basic example for one pedigree

# Since input parameter is a "pre" file, create a "pre" file for one pedigree

# make a data.frame to write to a file
ped.id <- rep(7,7)
person <- c(1,2,3,4,5,6,7)
father <- c(0,0,0,1,0,3,5)
mother <- c(0,0,0,2,0,4,4)
sex    <- c(1,2,1,2,1,1,1)
chrom1 <- c(1,3,5,0,7,0,0)
chrom2 <- c(2,4,6,0,8,0,0)
ped7.df <- data.frame(ped.id, person, father, mother, 
                     sex, chrom1, chrom2)

# write the file
write.table(ped7.df, file="ped7.pre", row.names=FALSE, col.names=FALSE)

ped7.ibdVar <- sim.ibd.var("ped7.pre", n.sim=1000)

# results are long and difficult to interpret
# here is an example of how to view
# > print(ped7.ibdVar[[1]], digits=2)

# demonstrate for x.linked=TRUE
ped7.ibdVarX <- sim.ibd.var("ped7.pre", n.sim=1000, x.linked=TRUE)



