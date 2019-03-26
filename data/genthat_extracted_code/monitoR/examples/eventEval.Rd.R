library(monitoR)


### Name: eventEval
### Title: Evaluate Detected Events with Known Event Sources and Times
### Aliases: eventEval
### Keywords: manip

### ** Examples

# Load data
data(btnw)
data(survey)

# Write Wave objects to file (temporary directory used here)
btnw.fp <- file.path(tempdir(), "btnw.wav")
survey.fp <- file.path(tempdir(), "survey2010-12-31_120000_EST.wav")
writeWave(btnw, btnw.fp)
writeWave(survey, survey.fp)

# Make a template
btemp <- makeBinTemplate(btnw.fp, frq.lim = c(2, 8), select = "auto", name = "btnw1", buffer =
                         4, amp.cutoff = -31, binary = TRUE)

# Binary point matching
scores <- binMatch(survey = survey.fp, templates = btemp, time.source = "fileinfo")

# Isolate peaks
pks <- findPeaks(scores)

# Evaluate peaks
data(survey_anno)

survey_anno <- survey_anno[survey_anno['name'] == 'BTNW', ]  # Extract the "BTNW" rows

peaks <- getPeaks(pks) 

eval <- eventEval(detections = peaks, standard = survey_anno, score.cutoff = 15)






