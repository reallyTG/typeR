library(rsed)


### Name: streamEdit
### Title: High-level wrapper for stream editing functions
### Aliases: streamEdit
### Keywords: misc

### ** Examples

################################################################################
# Let's create an example stream we can edit
################################################################################
cat("Here's a line\n",
   "Line after which we'll insert a string\n",
   "A line we'll delete\n",
   "A line we'll replace with something else\n",
   "A line where we'll make a substitution\n",
   "A line we'll comment\n",
   "The last line\n",
   sep = "", file = "tmpTest_streamEdit.txt")

# Read the file into a 'stream'
s <- readLines("tmpTest_streamEdit.txt")

################################################################################
# Excecute a series of commands 'manually', using the individual worker functions
################################################################################

s <- sed_insert(s, after = 3, insertion = "Here's an insertion")
s <- sed_replace(s, at = "delete", replacement = NULL)
s <- sed_replace(s, at = "we'll replace", replacement = "The replacement", fixed = TRUE)
s <- sed_substitute(s, pattern = "make a substitution", replacement = "have a party")
s <- sed_comment(s, at = "comment", type = "html")
s

################################################################################
# Now execute these same commands using a single call to streamEdit(), along
# with reading the input file and writing the output file
################################################################################

# Build the list of commands
comList <- list(

 # i for 'insert', arguments for sed_insert()
 i = list(after = 3, insertion = "Here's an insertion"),

 # r for 'replace', arguments for sed_replace()
 r = list(at = "delete", replacement = NULL),

 # r for 'replace', arguments for sed_replace()
 r = list(at = "we'll replace", replacement = "The replacement", fixed = TRUE),

 # s for 'substitute', arguments for sed_substitute()
 s = list(pattern = "make a substitution", replacement = "have a party"),

 # c for 'comment', arguments for sed_comment()
 c = list(at = "comment", type = "html")

)

s1 <- streamEdit(comList, inFile = "tmpTest_streamEdit.txt",
                outFile = "tmpTest_streamEdit1.txt")
s1

# Compare the results
identical(s, s1)

# Remove the files
unlink(c("tmpTest_streamEdit.txt", "tmpTest_streamEdit1.txt"))



