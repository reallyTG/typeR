library(pks)


### Name: chess
### Title: Responses to Chess Problems and Knowledge Structures
### Aliases: chess
### Keywords: datasets

### ** Examples

data(chess)
chess$dst1  # knowledge structure DST1
chess$dst3  # knowledge structure DST3
chess$dst4  # knowledge structure DST4
chess$N.R   # response patterns

## Precedence relation (Held et al., 1995, p. 215) and knowledge space
B <- as.binmat(c("1000000000000000",   # s
                 "1100000011000110",   # gs
                 "1110000011000110",   # egs
                 "1001000011000110",   # eegs
                 "0000100010000000",   # cs
                 "1110110011000111",   # gcs
                 "0000001010000100",   # ts
                 "1110000111000110",   # ges
                 "0000000010000000",   # f
                 "1000000011000110",   # gf
                 "1000000011100110",   # gff
                 "1110001011010110",   # ggff
                 "1111001011101111",   # ggf
                 "0000000000000100",   # ff
                 "0000000000000010",   # tf
                 "1000000010000111"))  # tff
K <- as.binmat(closure(as.pattern(B, as.set = TRUE)) + set(set()))
all(sort(as.pattern(chess$dst3)) == sort(as.pattern(K)))



