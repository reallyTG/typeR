library(tableplot)


### Name: NEO
### Title: Factor solutions for the NEO PI-R
### Aliases: NEO NEO.n NEO.s
### Keywords: datasets

### ** Examples

data(NEO.n); data(NEO.s)

# Examples from Kwan et al., 2009

# Plot of Normative patter, first 12 facets:
tableplot(  
	values = round( 100 * t(NEO.n[1:12,])),
	label.size = 1.5,
	cell.specs=list(
	list(0,"blue",1,1,"red",1,"white","grey90",1,1.5,"grey50",FALSE,"grey40",100)),
	v.parts = c(6,6), 
	gap = 3,
	left.space=15, 
	top.space=15,
	assign.sets = matrix(1,5,12))


facnames <- c("N","E","O","A","C")
itmnames <- as.vector(t(outer(facnames, 1:6, paste, sep="")))

# Put the patterns together:
  neopir <- array(NA, c(6,31,2))
  neopir[1:5,1:30,1] <- t(NEO.n) # Normative
  neopir[1:5,1:30,2] <- t(NEO.s) # Shona

# Calculate congruence coefficients for variables:
  for (j in 1:30){
	neopir[6,j,] <- round(congruence.coef(neopir[1:5,j,1],neopir[1:5,j,2]),2)	}

# Calculate congruence coefficients for factors:
  for (i in 1:5){
	neopir[i,31,] <- round(congruence.coef(neopir[i,1:30,1],neopir[i,1:30,2]),2)	}
	
# Plug in the total congruence coefficient:
  neopir[6,31,] <- 0.89

# Get rid of decimals:
  neopir <- round(neopir * 100)
 
 dimnames(neopir) <- list( c(facnames, "phi"), c(itmnames, "phi"), c("Normative", "Shona"))

# Plot of Normative and Shona, superimposed and augmented:
	B       <- matrix(1,6,31)
	B[6,]   <- 2
	B[,31]  <- 2

tableplot(
	values = neopir,
	label.size = 0.8,
	cell.specs=list(
	list(0,"blue",1,1,"red",1,"white","grey95",2,0.6,"grey50",FALSE,"grey40",100),
	list(0,"blue",1,1,"red",1,"yellow","grey60",1,0.6,"grey10",FALSE,"grey40",100)),
	v.parts = c(6,6,6,6,6,1), 
	h.parts = c(5,1), 
	gap = 1,
	left.space=8,
	assign.sets = B)




