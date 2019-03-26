library(phylosim)


### Name: getComments.PSRoot
### Title: Get the comments associated with an object
### Aliases: getComments.PSRoot PSRoot.getComments
###   getComments,PSRoot-method

### ** Examples

	# create an object
	o<-PSRoot()
	# add some comments
	setComments(o,"Random comment")
	# get the comment
	getComments(o)
	# get/set the comment via virtual fiels
	o$comments<-"Second random comment"
	o$comments
 


