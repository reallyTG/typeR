library(phylosim)


### Name: Site
### Title: The Site class
### Aliases: Site

### ** Examples

		# create a site object
		site<-Site();
		# print the character representation (state)
		print(site);
		# get a summary
		summary(site);
		# create a site with a nucleotide alphabet
		site<-Site(state="A",alphabet=NucleotideAlphabet());
		# set site state
		site$state<-"G"
		# manipulate the associated Sequence object
		site$sequence<-Sequence()
		site$sequence
		# attach a substitution process
		site$processes<-list(JC69())
		# add one more substitution process
		attachProcess(site,K80())
		# get a list of active Event objects
		site$events
		# get a summary of the Site object
		summary(site);
 


