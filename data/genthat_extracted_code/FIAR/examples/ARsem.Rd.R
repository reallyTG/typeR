library(FIAR)


### Name: ARsem
### Title: Auto-regressive SEM
### Aliases: ARsem
### Keywords: ~SEM ~auto-regressive

### ** Examples

# Example dataset with three brainregions x, y, z.
head(semdata)
# Prior model with connections from (column) x to (row) y and from y to z.
model <- c(0,0,0,
           1,0,0,
	   0,1,0)
# Perform classical SEM

 fit0 <- ARsem(model,semdata)
 summary(fit0)

# Calculate AR() order of the data
ARorder(semdata,max=10)

# Compute AR(3) SEM
 fit3 <- ARsem(model,semdata,order=3)
 summary(fit3)



