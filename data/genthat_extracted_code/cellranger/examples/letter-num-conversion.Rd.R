library(cellranger)


### Name: letter-num-conversion
### Title: Convert between letter and integer representations of column IDs
### Aliases: letter-num-conversion letter_to_num num_to_letter

### ** Examples

letter_to_num('Z')
letter_to_num(c('AA', 'ZZ', 'ABD', 'ZZZ'))
letter_to_num(c(NA, ''))
num_to_letter(28)
num_to_letter(900)
num_to_letter(18278)
num_to_letter(c(25, 52, 900, 18278))
num_to_letter(c(NA, 0, 4.8, -4))



