library(md.log)


### Name: md.log
### Title: md.log
### Aliases: md.log

### ** Examples

# --------------------------------------------------------------------
# Testing the md.log package
# ====================================================================

child = function() {
  md.log("current function", level="dope!")
}

parent = function(){
 md.log("step 2")
 child()
}

grandparent = function() {
 md.log("step 3")
 parent()
}

# The main test function that produces the log and calls the other functions
md.log.test = function() {
 require(md.log)
 md.log("Initiating a new Markdown log", file="markdown.log")

 # starting the logs
 md.log("a simple MONOSPACE log")
 md.log("Adding a level", level="notice")
 md.log("level makes you pay attention to a particular line")

 # add a subsection and a paragraph in the log
 md.log("This is a subsection", section="subsection")
 md.log("This is a text paragraph for detailed explanation...", section="paragraph")

 # testing the function call
 child()
 md.log("so far so good! now let's test a more complex nest")
 grandparent()
}

md.log.test()



