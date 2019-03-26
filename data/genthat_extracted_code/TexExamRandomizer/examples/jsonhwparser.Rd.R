library(TexExamRandomizer)


### Name: jsonhwparser
### Title: Json Homework Parser
### Aliases: jsonhwparser

### ** Examples

## Not run: 
##D #!/bin/Rscript
##D #This example showcases the type of script this jsonparser might be used on.
##D # You can still use it without a script,
##D # just by adding a list that has the same names as the list provided in opt
##D library(optparse)
##D option_list <- list(
##D     make_option(
##D         c("--file"),
##D         action = "store",
##D         default = NULL,
##D         type = 'character',
##D         help = "Filename of the Tex File"
##D     ),
##D     make_option(
##D         c("--table"),
##D         action = "store",
##D         default = NULL,
##D         type = 'character',
##D         help = "Filename of the table to break down. It overwrites the values written on the file"
##D     ),
##D     make_option(
##D         c("-s", "--seed"),
##D         action = "store",
##D         default = NULL,
##D         type = "integer",
##D         help = "Seed for any randomization done"
##D     ),
##D     make_option(
##D         c("-c", "--compile"),
##D         action = "store_true",
##D         default = FALSE,
##D         type = "logical",
##D         help = "Should the output folder be compiled or not"
##D     ),
##D     make_option(
##D         c("--xelatex"),
##D         action = "store_true",
##D         default = FALSE,
##D         type = "logical",
##D         help = "Should we use xelatex to compile or not"
##D     ),
##D     make_option(
##D         c("-d", "--debug"),
##D         action = "store_true",
##D         default = FALSE,
##D         type = "logical",
##D         help = "If debugging, it doesn't remove auxiliary files"
##D     )
##D )
##D 
##D 
##D #### PARSING OPTIONS ####
##D ####
##D opt <-
##D     parse_args(
##D         OptionParser(option_list = option_list),
##D         positional_arguments = TRUE
##D     )
##D 
##D # Let's assume the file was the example file
##D testfile <-
##D     system.file(
##D         "extdata",
##D         "ExampleTexDocuments",
##D         "exam_testing_nquestions.tex", #Test exam that doesn't require a table
##D         package = "TexExamRandomizer")
##D 
##D # To prevent modifying the file system in examples
##D temporalfile <- paste(tempfile(), ".tex", sep = "")
##D 
##D file.copy(testfile, temporalfile)
##D 
##D opt$options$file <- temporalfile
##D 
##D 
##D 
##D jsonhwparser(opt)
## End(Not run)




