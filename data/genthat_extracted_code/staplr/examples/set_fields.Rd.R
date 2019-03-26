library(staplr)


### Name: set_fields
### Title: Set fields of a pdf form
### Aliases: set_fields

### ** Examples

## Not run: 
##D pdfFile = system.file('testForm.pdf',package = 'staplr')
##D fields = get_fields(pdfFile)
##D 
##D fields$TextField1$value = 'this is text'
##D fields$TextField2$value = 'more text'
##D fields$RadioGroup$value = 2
##D fields$checkBox$value = 'Yes'
##D 
##D set_fields(pdfFile,'filledPdf.pdf',fields)
## End(Not run)




