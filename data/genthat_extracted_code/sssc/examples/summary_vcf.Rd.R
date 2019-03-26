library(sssc)


### Name: summary_vcf
### Title: VCF Data Summary
### Aliases: summary_vcf

### ** Examples

data("vcf_example")
tmp <- summary_vcf(vcf = vcf_example, ZG = 'het', CHR = c(1,2))
plot(tmp$scatter)
plot(tmp$density)



