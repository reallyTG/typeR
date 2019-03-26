library(Peptides)


### Name: membpos
### Title: Compute theoretically the class of a protein sequence
### Aliases: membpos

### ** Examples

membpos(seq = "ARQQNLFINFCLILIFLLLI",angle = 100)
#       Pep        H     uH       MembPos
# 1 ARQQNLFINFCL 0.083 0.353      Globular
# 2 RQQNLFINFCLI 0.147 0.317      Globular
# 3 QQNLFINFCLIL 0.446 0.274      Globular
# 4 QNLFINFCLILI 0.632 0.274 Transmembrane
# 5 NLFINFCLILIF 0.802 0.253       Surface
# 6 LFINFCLILIFL 0.955 0.113 Transmembrane
# 7 FINFCLILIFLL 0.955 0.113 Transmembrane
# 8 INFCLILIFLLL 0.944 0.108 Transmembrane
# 9 NFCLILIFLLLI 0.944 0.132 Transmembrane

membpos(seq = "ARQQNLFINFCLILIFLLLI",angle = 160)
#       Pep        H     uH    MembPos
# 1 ARQQNLFINFCL 0.083 0.467  Globular
# 2 RQQNLFINFCLI 0.147 0.467  Globular
# 3 QQNLFINFCLIL 0.446 0.285  Globular
# 4 QNLFINFCLILI 0.632 0.358  Surface
# 5 NLFINFCLILIF 0.802 0.358  Surface
# 6 LFINFCLILIFL 0.955 0.269  Surface
# 7 FINFCLILIFLL 0.955 0.269  Surface
# 8 INFCLILIFLLL 0.944 0.257  Surface
# 9 NFCLILIFLLLI 0.944 0.229  Surface



