library(pkgcond)


### Name: skip_scope
### Title: Exclude a function from find_scope
### Aliases: skip_scope

### ** Examples

new_msg <- function(where=find_scope()){
    "Hello from" %<<% where
}
new_postcard <- function(msg){
    greeting <- new_msg()
    paste0(greeting, '\n\n', msg)
}

cat(new_postcard("Not all is well"), '\n')
new_msg <- skip_scope(new_msg)

cat(new_postcard("Now all is well"))



