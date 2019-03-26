library(BaTFLED3D)


### Name: get_data_params
### Title: Get parameters for building a model with known relationships
### Aliases: get_data_params

### ** Examples

args <- c('decomp=Tucker', 'row.share=F',
          'A1.intercept=T', 'A2.intercept=T', 'A3.intercept=F',
          'H1.intercept=T', 'H2.intercept=T', 'H3.intercept=T',
          'R1=4', 'R2=4', 'R3=2')
data.params <- get_data_params(args)



