library(tcR)


### Name: codon.variants
### Title: Functions for working with aminoacid sequences.
### Aliases: codon.variants translated.nucl.sequences reverse.translation

### ** Examples

codon.variants('ACT')
translated.nucl.sequences(c('ACT', 'CASSLQ'))
reverse.translation('T')  # -> "ACA" "ACC" "ACG" "ACT"
reverse.translation('T', 'XXT')  # -> "ACT"
translated.nucl.sequences('ACT', 'XXXXXXXC')
codon.variants('ACT', 'XXXXXXXC')
reverse.translation('ACT', 'XXXXXXXC')



