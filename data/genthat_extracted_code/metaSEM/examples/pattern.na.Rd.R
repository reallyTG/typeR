library(metaSEM)


### Name: pattern.na
### Title: Display the Pattern of Missing Data of a List of Square Matrices
### Aliases: pattern.na
### Keywords: utilities

### ** Examples

## Show the pattern of missing data
pattern.na(Hunter83$data, show.na=TRUE)

#             Ability Knowledge Work sample Supervisor
# Ability           1         3           3          2
# Knowledge         3         2           4          3
# Work sample       3         4           2          3
# Supervisor        2         3           3          1

## Show the pattern of data that are present
pattern.na(Hunter83$data, show.na=FALSE)

#             Ability Knowledge Work sample Supervisor
# Ability          13        11          11         12
# Knowledge        11        12          10         11
# Work sample      11        10          12         11
# Supervisor       12        11          11         13



