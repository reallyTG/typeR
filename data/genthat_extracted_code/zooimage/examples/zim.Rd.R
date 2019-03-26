library(zooimage)


### Name: zim
### Title: Manipulate .zim files (ZooImage Metadata/Measurements)
### Aliases: isZim zimCreate zimEdit zimExtractAll zimMake
###   zimDatMakeFlowCAM zimDatMakeFlowCAMAll zimUpdateAll zimVerify
### Keywords: utilities

### ** Examples

## Create a minimalist .zim file from current template
(zimfile <- paste(tempfile(), "zim", sep = "."))
zimCreate(zimfile, edit = FALSE)

## Display its content
if (interactive()) file.show(zimfile)

## List .zim files in the temporary directory
zimList(tempdir())

## Is this a correct .zim file?
isZim(zimfile)
zimVerify(zimfile) # Returns 0 => verification OK, with 0 records in [Data]

## The rest of this example is for programmers
## Add more required sections and keys for metadata verifications
## Add more required columns in the table of measurements
options(ZI.zim = list(active = TRUE,
    zim.required = c("[NewSection]", "requiredkey1", "requiredkey2"),
    dat1.zim.required = c("[PostProcess]", "requiredkey3"),
    dat1.data.required = c("Area", "Perim.", "Circ.", "Feret")))
try(zimVerify(zimfile)) # Of course, these new keys are missing!

## Now, inactivate these extra verifications without deleting them
oZI.zim <- getOption("ZI.zim")
oZI.zim$active <- FALSE
options(ZI.zim = oZI.zim)
rm(oZI.zim) # not needed any more
zimVerify(zimfile) # This time, extra verifications are not used any more => OK!

## Add some verification code to the existing verification procedure
options(ZI.zim = list(active = TRUE,
    verify = function (zimfile, ...) {
        # Your verification code here, for instance:
        Lines <- scan(zimfile, character(), sep = "\t", skip = 1, flush = TRUE,
		    quiet = TRUE, comment.char = "#")
        ## Check if 'Code=B' or 'Code=C', using regular expression
        ## Extra spaces are allowed before and after '=', and after the value
        if (length(grep("^Code\\s*=\\s*[B|C]\\s*$", Lines)) == 0) {
            ## The condition is not matched!
            return("[Fraction] Code must be either 'B', or 'C'!")
        } else {
            ## Everything is fine: return an empty string
            return("")
        }
}))
try(zimVerify(zimfile)) # Since Code=A, verification fails!

## Reset original verification rules
options(ZI.zim = NULL)

## Erase the example .zim file
unlink(zimfile)



