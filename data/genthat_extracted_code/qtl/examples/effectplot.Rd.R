library(qtl)


### Name: effectplot
### Title: Plot phenotype means against genotypes at one or two markers
### Aliases: effectplot
### Keywords: hplot

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(1, 13, "X"))
## End(Don't show)

# impute genotype data
## Not run: fake.f2 <- sim.geno(fake.f2, step=5, n.draws=64)
## Don't show: 
fake.f2 <- sim.geno(fake.f2, step=5, n.draws=8)
## End(Don't show)

########################################
# one marker plots
########################################
### plot of genotype-specific phenotype means for 1 marker
mname <- find.marker(fake.f2, 1, 37) # marker D1M437
effectplot(fake.f2, pheno.col=1, mname1=mname)

### output of the function contains the means and SEs
output <- effectplot(fake.f2, mname1=mname)
output

### plot a phenotype
# Plot of sex-specific phenotype means,
# note that "sex" must be a phenotype name here
effectplot(fake.f2, mname1="sex", geno1=c("F","M"))
# alternatively:
sex <- pull.pheno(fake.f2, "sex")
effectplot(fake.f2, mname1="Sex", mark1=sex, geno1=c("F","M"))

########################################
# two markers plots
########################################

### plot two markers
# plot of genotype-specific phenotype means for 2 markers
mname1 <- find.marker(fake.f2, 1, 37) # marker D1M437
mname2 <- find.marker(fake.f2, 13, 24) # marker D13M254
effectplot(fake.f2, mname1=mname1, mname2=mname2)

### plot two pseudomarkers
#####  refer to pseudomarkers by their positions
effectplot(fake.f2, mname1="1@35", mname2="13@25")

#####  alternatively, find their names via find.pseudomarker
pmnames <- find.pseudomarker(fake.f2, chr=c(1, 13), c(35, 25))
effectplot(fake.f2, mname1=pmnames[1], mname2=pmnames[2])

### Plot of sex- and genotype-specific phenotype means 
mname <- find.marker(fake.f2, 13, 24) # marker D13M254
# sex and a marker
effectplot(fake.f2, mname1=mname, mname2="Sex",
           mark2=sex, geno2=c("F","M"))

# Same as above, switch role of sex and the marker
# sex and marker
effectplot(fake.f2, mname1="Sex", mark1=sex,
           geno1=c("F","M"), mname2=mname)

# X chromosome marker
mname <- find.marker(fake.f2, "X", 14) # marker DXM66
effectplot(fake.f2, mname1=mname)

# Two markers, including one on the X
mnames <- find.marker(fake.f2, c(13, "X"), c(24, 14))
effectplot(fake.f2, mname1=mnames[1], mname2=mnames[2])



