library(highSCREEN)


### Name: rankhits
### Title: Rank hits
### Aliases: rankhits

### ** Examples

set.seed(1234)
nc = 24
nr = 16

# create 1st replicate of data matrix with compounds and controls
r1 = matrix(abs(rnorm(nr*nc)*0.01), nr, nc)

# create control map
cmap = data.frame(X1=c(rep("Control P", floor(nr/3)), 
rep(c("Control low", "Control med", "Control high"), 
(floor(nr/3)+nr-3*floor(nr/3))/3), rep("Control N", 
floor(nr/3))), X2=c(rep("Control N", floor(nr/3)), 
rep(c("Control low", "Control med", "Control high"), 
(floor(nr/3)+nr-3*floor(nr/3))/3), rep("Control P", floor(nr/3))))
cmap = cmap[seq(1,nr,2),]

# create 2nd replicate of data matrix with compounds and controls
r2 = matrix(abs(rnorm(nr*nc)*0.01), nr, nc)

# create 3rd replicate of data matrix with compounds and controls
r3 = matrix(abs(rnorm(nr*nc)*0.01), nr, nc)

# combine all replicates for the t0-specific data
replicates_t0 = list(r1, r2, r3)
names(replicates_t0) = c("R1", "R2", "R3")

# create 1st replicate of data matrix with compounds and controls
r1 = matrix(abs(rnorm(nr*nc)), nr, nc)

# create 2nd replicate of data matrix with compounds and controls
r2 = matrix(abs(rnorm(nr*nc)), nr, nc)

# create 3rd replicate of data matrix with compounds and controls
r3 = matrix(abs(rnorm(nr*nc)), nr, nc)

# combine all replicates for the t1-specific data
replicates_t1 = list(r1, r2, r3)
names(replicates_t1) = c("R1", "R2", "R3")

# extract plate 1, replicate 1
dat1 = extractplate(replicates_t0, replicates_t1, plate=1, replicate=1)
# extract plate 1, replicate 2
dat2 = extractplate(replicates_t0, replicates_t1, plate=1, replicate=2)
# extract plate 1, replicate 3
dat3 = extractplate(replicates_t0, replicates_t1, plate=1, replicate=3)

# no normalizion
datraw1 = normplate("Main Plate 1", dat1[["dat0"]], dat1[["dat1"]], cmap,
 plate=1, replicate=1, norm="raw")
datraw2 = normplate("Main Plate 1", dat2[["dat0"]], dat2[["dat1"]], cmap,
 plate=1, replicate=2, norm="raw")
datraw3 = normplate("Main Pltae 1", dat3[["dat0"]], dat3[["dat1"]], cmap,
 plate=1, replicate=3, norm="raw")

# combine 3 replicates
datraw = rbind(datraw1, datraw2, datraw3)

# reformat result
datraw = formatRESULT(datraw, replicate="Replicate", t="Time")

# c-score normalization
datnorm1 = normplate("Main Plate 1", dat1[["dat0"]], dat1[["dat1"]], cmap,
 plate=1, replicate=1, norm="cscore", 
poscont="Control P", negcont="Control N")
datnorm2 = normplate("Main Plate 1", dat2[["dat0"]], dat2[["dat1"]], cmap,
 plate=1, replicate=2, norm="cscore", 
poscont="Control P", negcont="Control N")
datnorm3 = normplate("Main Pltae 1", dat3[["dat0"]], dat3[["dat1"]], cmap,
 plate=1, replicate=3, norm="cscore", 
poscont="Control P", negcont="Control N")

# combine 3 replicates
datnorm = rbind(datnorm1, datnorm2, datnorm3)

# reformat result
datnorm = formatRESULT(datnorm, replicate="Replicate", t="Time")

# identify hits
h = hits(datraw, datnorm, qc.mainplates="Main Plate 1", qc1.val=0.225, hit.val=3)

# rank hits in disending order of mean of t1-specific replicate scores "m1"
head(rankhits(h))



