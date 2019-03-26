library(genderBR)


### Name: map_gender
### Title: Map the use of Brazilian first names by gender and by state
### Aliases: map_gender

### ** Examples

# Map the use of the name 'Joao' for
# males in Brazil by state
map_gender('Joao', gender = 'm')

## No test: 
# Map the use of the name 'Maria'
map_gender('maria')

# The function accepts full names
map_gender('Maria da Silva Santos')

# Or names in uppercase
map_gender('MARIA DA SILVA SANTOS')
## End(No test)

## Don't show: 
map_gender('AUGUSTO ROBERTO', gender = 'm')
map_gender('John da Silva', gender = 'm')
## End(Don't show)





