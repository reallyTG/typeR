library(valr)


### Name: read_bed
### Title: Read BED and related files.
### Aliases: read_bed read_bed12 read_bedgraph read_narrowpeak
###   read_broadpeak

### ** Examples

# read_bed assumes 3 field BED format.
read_bed(valr_example('3fields.bed.gz'))

read_bed(valr_example('6fields.bed.gz'), n_fields = 6)

# result is sorted by chrom and start unless `sort = FALSE`
read_bed(valr_example('3fields.bed.gz'), sort = FALSE)


read_bed12(valr_example('mm9.refGene.bed.gz'))


read_bedgraph(valr_example('test.bg.gz'))


read_narrowpeak(valr_example('sample.narrowPeak.gz'))


read_broadpeak(valr_example('sample.broadPeak.gz'))




