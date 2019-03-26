library(twoway)


### Name: print.twoway
### Title: Print method for two-way tables
### Aliases: print.twoway

### ** Examples

data(taskRT)
task.2way <- twoway(taskRT)
print(task.2way)
print(task.2way, border=0)

data(sentRT)
sent.2way <- twoway(sentRT)
print(sent.2way)
print(sent.2way, border=1)




