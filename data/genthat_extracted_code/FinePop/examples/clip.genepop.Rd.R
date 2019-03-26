library(FinePop)


### Name: clip.genepop
### Title: Remove designated markers from a GENEPOP file.
### Aliases: clip.genepop

### ** Examples

# Example of GENEPOP file
data(jsmackerel)
cat(jsmackerel$MS.genepop, file="JSM_MS_genepop.txt", sep="\n")

# remove markers designated by their names
clip.genepop("JSM_MS_genepop.txt", "JSM_genepop_clipped_name.txt",
             remove.list=c("Sni21","Sni26"))

# remove markers with high major allele frequencies (in this example, > 0.5)
clip.genepop("JSM_MS_genepop.txt", "JSM_genepop_clipped_maf.txt",
             major.af=0.5)

# remove markers both by their names and by major allele frequencies
clip.genepop("JSM_MS_genepop.txt", "JSM_genepop_clipped_both.txt",
             remove.list=c("Sni21","Sni26"), major.af=0.5)



