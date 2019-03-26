library(ips)


### Name: write.fas
### Title: Write DNA Sequences to File
### Aliases: write.fas write.phy write.nex

### ** Examples

## bark beetle COX1 sequences
## --------------------------
data(ips.cox1)
ips.cox1 <- ips.cox1[1:4, 1:120]

## Examples for FASTA files
## ------------------------
write.fas(ips.cox1, interleave = 60)

## Examples for PHYLIP files
## ------------------------
write.phy(ips.cox1, interleave = 40)

## Examples for NEXUS files
## ------------------------
# write nexus file with taxon block
write.nex(ips.cox1, taxblock = TRUE)
# write non-interleaved nexus file without taxon block
write.nex(ips.cox1, interleave = FALSE)

# Truncation of taxonnames:
# -------------------------
rownames(ips.cox1)[1] <- "AVeeeeeeeeeeeeeeeeeryLongName"
write.fas(ips.cox1, truncate = 10)

# If truncation leads to identical taxonnames,
# a warning will be issued:
# -------------------------
rownames(ips.cox1)[1:2] <- "AVeeeeeeeeeeeeeeeeeryLongName"
write.fas(ips.cox1, truncate = 10)



