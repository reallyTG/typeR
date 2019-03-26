library(bannerCommenter)


### Name: banner
### Title: Make a decorated comment in an R script
### Aliases: banner block boxup open_box section

### ** Examples

banner("This should appear clearly and stand out.",
       "The lines are left justified by default.")
section("This is the first line in a section heading",
        "and this is the second\nand this the third.")
boxup("This is a less obtrusive comment",
      "centred on multiple lines", center = TRUE, bandChar = ".")
banner("This is an important side issue.", "Take note!",
      snug = TRUE, bandChar = "=")
open_box("This is a succinctly presented comment",
         "left justified and open at the right",
         "on multiple lines")

block("This is a chatty comment.  Entering it this way just",
      "saves a tiny bit of typing but it can be useful if",
      "you need multiple initial hash marks, as you may when",
      "using Emacs/ESS, for example.",
      "Or if you want the lines centred for some odd reason.",
      center = TRUE)
## some authors like to use lines of a uniform length to separate code sections:
boxup("")



