library(phylosim)


### Name: AminoAcidSequence
### Title: The AminoAcidSequence class
### Aliases: AminoAcidSequence

### ** Examples

	# create an empty AminoAcidSequence object
	s<-AminoAcidSequence(length=50)
	s
	# set states
	s$states<-c("C","C","G","Y")
	s
	# create a sequence object by specifying a string
	s<-AminoAcidSequence(string="CNGGYCCNGYYYY")
	s
 


