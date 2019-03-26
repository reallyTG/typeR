library(numform)


### Name: f_list
### Title: Format List Series
### Aliases: f_list f_list_amp ff_list

### ** Examples

f_list(1)
f_list(1:2)
f_list(1:3)
f_list(1:5)

x <- c("parents", "Lady Gaga",  "Humpty Dumpty")
## Three things you love
sprintf('I love my %s.', f_list(x))
## Your parents are lady Gaga & Humpty Dumpty?????
sprintf('I love my %s.', f_list(x, oxford = FALSE))

sprintf('I love my %s.', f_list(x, and = '&'))
sprintf('I love my %s.', f_list_amp(x))



