library(phylosim)


### Name: Translate.CodonSequence
### Title: Translate a CodonSequence object
### Aliases: Translate.CodonSequence CodonSequence.Translate
###   Translate,CodonSequence-method

### ** Examples

	# create a CodonSequence object
	s<-CodonSequence(string="ATCTTTCGAATGGGGCCCTCCCGA")
	# get the translation as an AminoAcidSequence object
	as<-Translate(s)
	as
 


