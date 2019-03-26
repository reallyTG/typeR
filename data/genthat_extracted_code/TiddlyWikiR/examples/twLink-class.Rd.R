library(TiddlyWikiR)


### Name: twLink-class
### Title: A class to handle TiddlyWiki links.
### Aliases: initialize,twLink-method label,twLink-method
###   label<-,twLink-method ref,twLink-method ref<-,twLink-method
###   show,twLink-method twLink twLink-class
### Keywords: link wiki

### ** Examples

new ("twLink", label = "the text here", ref = "aTiddlerNameHere")
twLink (label = "the text here", ref = "http://www.r-project.org/")

twLink ("here", ref = "http://www.dmontaner.com")
paste ("see my home page",
       twLink ("here", ref = "http://www.dmontaner.com"), ", I hope you like it.")



