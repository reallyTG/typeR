library(DMRMark)


### Name: reformData
### Title: Reform M-values into a two-column matrix.
### Aliases: reformData

### ** Examples


	# Assume the values come from Tumor is 10 larger than those from Normal.
	
	# The case with totally paired data 
	mv1 <- matrix(1:20,5)
	reformData(mv1)
	
	# The case with One more sample from Tumour group
	# The second Tumour sample is the extra one
	mv2 <- matrix(1:25,5)
	mv2[,2] <- mv2[,2] + 5 
	patient <- factor(c(1,3,1:3))
	type = c(rep("Normal",2),rep("Tumour",3))
	pd <- model.matrix(~patient + type + 0)
	reformData(mv2, pd)



