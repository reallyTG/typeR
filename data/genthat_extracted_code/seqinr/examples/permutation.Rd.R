library(seqinr)


### Name: permutation
### Title: Sequence permutation according to several different models
### Aliases: permutation
### Keywords: utilities

### ** Examples

  data(ec999)
  sequence=ec999[1][[1]]

  new=permutation(sequence,modele='base')
  identical(all.equal(count(new,1),count(sequence,1)),TRUE)

  new=permutation(sequence,modele='position')
  identical(all.equal(GC(new),GC(sequence)),TRUE)
  identical(all.equal(GC2(new),GC2(sequence)),TRUE)
  identical(all.equal(GC3(new),GC3(sequence)),TRUE)

  new=permutation(sequence,modele='codon')
  identical(all.equal(uco(new),uco(sequence)),TRUE)

  new=permutation(sequence,modele='syncodon',numcode=1)
  identical(all.equal(translate(new),translate(sequence)),TRUE)



