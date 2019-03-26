library(Interpol)


### Name: Interpol
### Title: Interpolation of encoded amino acid sequences
### Aliases: Interpol

### ** Examples


	#### V3 data
	data(V3)
	sequence = V3[1]

	#### encoding of sequence a with descriptor 151 and with normalization [0,1]
	b = AAdescriptor(sequence, 151, 2)
	b

	#### interpolation to length 27 with linear interpolation
	c = Interpol(b, 27, "linear")
	c

	#### plotting
	plot(unlist(b), type="l", col="darkgreen", ylim=c(-3,3), ylab="descriptor value", xlab="sequence position", lwd=2)
	lines(seq(1,length(unlist(b)),(length(unlist(b))/length(as.vector(c)))),as.vector(c), col="red", lwd=2)
	axis(3, at=seq(1,35, 35/27), labels=1:27)




