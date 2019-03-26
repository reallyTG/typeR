library(Biograph)


### Name: Sequences
### Title: Lists state sequences in the data
### Aliases: Sequences

### ** Examples

#	Example 1: Sequences in GLHS
	data(GLHS)
	z <- Parameters (GLHS)
	seq <- Sequences (Bdata=GLHS,mean_median="median")
	
#	Example 2: Sequences in NLOG98
	data(NLOG98)
	z <- Parameters (NLOG98)
	seq <- Sequences (NLOG98) # default is median age
	
#	Example 3: State sequence in NLOG98, by birth cohort
	table(NLOG98$cohort)   # cohort size
	seq.1 <- Sequences(NLOG98[NLOG98$cohort=="<1960",],"median")
	seq.2 <- Sequences(NLOG98[NLOG98$cohort=="1960+",],"median")
	# Note that the sum(seq.2$ncase) equals size of second cohort	
	


