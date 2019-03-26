library(commentr)


### Name: block_comment
### Title: Create nicely formated comments
### Aliases: block_comment comment commentr header_comment line_comment

### ** Examples

## Not run: 
##D 
##D # If global options specifies "author" and "contact", these do not need to be specified every time:
##D header_comment("Test", "This is a little test")
##D 
##D header_comment("Test", "This is just a test!", width = "script_width")
##D 
##D header_comment("Smaller block", "This is a smaller test block!", width = 55, tab = 17)
##D 
##D header_comment("Smaller block", "This is a small test block but with a longer extra description
##D    that has to be split from a single line into a full paragraph.", width = 55, tab = 17)
## End(Not run)

header_comment("Nice script", "This is a very nice script that is well documented",
     author       = "Jane Doe",
     contact      = "jane@doe.se",
     client       = "John Doe",
     date_created = "2014-07-03",
     width        = "a4landscape")

block_comment("A title for a new section in the script")
block_comment("A shorter box", width = 50)
block_comment("A compact title", empty_lines_first = 0, allign = "left")
## Not run: 
##D block_comment("A longer descriptive text that has to be
##D    separated into several lines in order to fit.
##D    Then it is no longer alligned to 'center' even if so specified!", allign = "center")
## End(Not run)
line_comment("A comment in the middle of a line")
line_comment("A comment in the middle of a shorter line", 50)



