library(saasCNV)


### Name: diagnosis.seg.plot.chr
### Title: Visualize Segmentation Results for Diagnosis
### Aliases: diagnosis.seg.plot.chr
### Keywords: segmentation diagnosis

### ** Examples

## visual diagnosis of joint segmentation results
data(seq.data)
data(seq.segs)
diagnosis.seg.plot.chr(data=seq.data, segs=seq.segs, 
                       sample.id="Joint Segmentation", 
                       chr=1, cex=0.3)

## visual diagnosis of results from merging step
data(seq.segs.merge)
diagnosis.seg.plot.chr(data=seq.data, segs=seq.segs.merge, 
                       sample.id="After Segments Merging Step", 
                       chr=1, cex=0.3)



