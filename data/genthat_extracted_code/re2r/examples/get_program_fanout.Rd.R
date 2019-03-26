library(re2r)


### Name: get_program_fanout
### Title: Get program fanout
### Aliases: get_program_fanout

### ** Examples

re1 = re2("(?:(?:(?:(?:(?:.)?){1})*)+)")
re10 = re2("(?:(?:(?:(?:(?:.)?){10})*)+)")
re100 = re2("(?:(?:(?:(?:(?:.)?){100})*)+)")
re1000 = re2("(?:(?:(?:(?:(?:.)?){1000})*)+)")

get_program_fanout(re1)
get_program_fanout(re10)
get_program_fanout(re100)
get_program_fanout(re1000)



