library(phylosim)


### Name: setComments.PSRoot
### Title: Set the comments associated with an object
### Aliases: setComments.PSRoot PSRoot.setComments
###   setComments,PSRoot-method

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
 


