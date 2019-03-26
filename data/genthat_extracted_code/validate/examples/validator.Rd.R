library(validate)


### Name: validator
### Title: Define validation rules for data
### Aliases: validator

### ** Examples


v <- validator(
  height>0
  ,weight>0
  ,height < 1.5*mean(height)
)
cf <- confront(women, v)
summary(cf)




