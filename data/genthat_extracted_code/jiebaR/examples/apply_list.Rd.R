library(jiebaR)


### Name: apply_list
### Title: Apply list input to a worker
### Aliases: apply_list

### ** Examples

cutter = worker()
apply_list(list("this is test", "that is not test"), cutter)
apply_list(list("this is test", list("that is not test","ab c")), cutter)



