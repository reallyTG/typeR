library(fun)


### Name: random_password
### Title: Generate a random password with a specified length
### Aliases: random_password

### ** Examples

random_password()
# set the seed to get fixed password every time; you may just remember the seed
# and forget the real password because it's reproducible
set.seed(123)
random_password()
# long password
random_password(20, TRUE)



