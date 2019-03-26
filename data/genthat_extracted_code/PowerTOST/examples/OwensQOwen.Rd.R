library(PowerTOST)


### Name: OwensQOwen
### Title: Owen's Q-function via repeated integration by parts
### Aliases: OwensQOwen

### ** Examples

# comparison of the results of both implementations
# both should give [1] 0.0731726
OwensQ(2, 2.92, 4.2135, 0, 2.0407)
OwensQOwen(2, 2.92, 4.2135, 0, 2.0407)



