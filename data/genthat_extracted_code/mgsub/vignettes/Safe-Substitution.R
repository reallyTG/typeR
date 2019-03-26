## ------------------------------------------------------------------------
s = "hey ho, let's go!"
gsub("hey","ho",s)

## ------------------------------------------------------------------------
s = "hey ho, let's go!"
gsub("hey|ho","yo",s)

## ------------------------------------------------------------------------
s = "hey ho, let's go!"
s_new = gsub("hey","get",s)
s_new = gsub("ho","ready",s_new)
s_new

## ------------------------------------------------------------------------
s = "hey ho, let's go!"
s_new = gsub("hey","ho",s)
s_new = gsub("ho","hey",s_new)
s_new

## ------------------------------------------------------------------------
library(mgsub)
s = "hey ho, let's go!"
mgsub::mgsub(string = s,pattern = c("hey","ho"),replacement = c("ho","hey"))

## ------------------------------------------------------------------------
s = "Dopazamine is not the same as dopachloride or dopastriamine, yet is still fake."
pattern = c("[Dd]opa([^ ]*?mine)","fake")
replacement = c("Meta\\1","real")
mgsub::mgsub(s,pattern,replacement)

## ------------------------------------------------------------------------
s = "All my life I chased $money$ and .power. - not love!"
pattern = c("$money$",".power.","love")
replacement = c("balloons","dolphins","success")
mgsub::mgsub(s,pattern,replacement,fixed=TRUE)

## ------------------------------------------------------------------------
s = "they don't understand the value of what they seek."
pattern = c("the","they")
replacement = c("a","we")
mgsub::mgsub(s,pattern,replacement)

## ------------------------------------------------------------------------
qdap::mgsub(pattern,replacement,s)

## ------------------------------------------------------------------------
s = "Dopazamine is a fake chemical"
pattern = c("dopazamin","do.*ne")
replacement = c("freakout","metazamine")
mgsub::mgsub(s,pattern,replacement,ignore.case=TRUE)

## ------------------------------------------------------------------------
qdap::mgsub(pattern,replacement,s,fixed = FALSE,ignore.case=TRUE)

## ------------------------------------------------------------------------
s = "hey, how are you?"
pattern = c("hey","how","are","you")
replacement = c("how","are","you","hey")
mgsub::mgsub(s,pattern,replacement)

## ------------------------------------------------------------------------
print(qdap::mgsub(pattern,replacement,s))
print(qdap::mgsub(pattern,replacement,s,fixed=FALSE,ignore.case=TRUE))

## ------------------------------------------------------------------------
library(microbenchmark)

s = c("Dopazamine is not the same as Dopachloride and is still fake.",
      "dopazamine is undergoing a review by the fake news arm of the Dopazamine government")
pattern = c("[Dd]opa(.*?mine)","fake")
replacement = c("Meta\\1","real")

microbenchmark(
  mgsub = mgsub::mgsub(s[1],pattern,replacement),
  qdap = qdap::mgsub(pattern,replacement,s[1],fixed=FALSE)
)

microbenchmark(
  mgsub = mgsub::mgsub(s,pattern,replacement),
  qdap = qdap::mgsub(pattern,replacement,s,fixed=FALSE)
)

