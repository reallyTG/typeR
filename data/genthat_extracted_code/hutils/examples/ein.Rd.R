library(hutils)


### Name: %ein%
### Title: Exists and (not) in
### Aliases: %ein% %enotin%

### ** Examples

# Incorrectly assumed to include two Species
iris[iris$Species %in% c("setosa", "versicolour"), ]
## Not run: 
##D # Error:
##D iris[iris$Species %ein% c("setosa", "versicolour"), ]
## End(Not run)



