library(DTSg)


### Name: S3WrapperGenerator
### Title: S3 Wrapper Generator
### Aliases: S3WrapperGenerator

### ** Examples

# generate S3 wrapper for aggregate of DTSg
aggregate.DTSg <- S3WrapperGenerator(
  R6Method = expression(DTSg$public_methods$aggregate)
)




