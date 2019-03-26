library(rtimicropem)


### Name: convert_output
### Title: Uses output file from MicroPEM to create a 'micropem' object.
### Aliases: convert_output

### ** Examples

micropem_example <- convert_output(system.file('extdata', 'CHAI.csv', package = 'rtimicropem'))
micropem_example$plot()
micropem_example$plot(title = "wow")



