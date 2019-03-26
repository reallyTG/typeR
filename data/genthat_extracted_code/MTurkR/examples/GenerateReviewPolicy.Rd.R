library(MTurkR)


### Name: GenerateReviewPolicy
### Title: Generate HIT and/or Assignment ReviewPolicies
### Aliases: GenerateHITReviewPolicy GenerateAssignmentReviewPolicy
### Keywords: HITs

### ** Examples

## Not run: 
##D # HIT-level ReviewPolicies #
##D 
##D ## Conditionally extend HIT based on HIT Agreement Score
##D lista <- list(QuestionIds = c("Question1","Question2","Question5"),
##D               QuestionAgreementThreshold = 49, # at least 50 percent agreement
##D               ExtendIfHITAgreementScoreIsLessThan = 50,
##D               ExtendMinimumTimeInSeconds = 3600,
##D               ExtendMaximumAssignments = 2,
##D               DisregardAssignmentIfRejected = TRUE)
##D policya <- do.call(GenerateHITReviewPolicy, lista)
##D 
##D ## Conditionally approve and reject based on Worker Agreement Score
##D listb <- list(QuestionIds = c("Question1","Question2","Question5"),
##D               QuestionAgreementThreshold = 65, # at least two of three 'correct' answers
##D               ApproveIfWorkerAgreementScoreIsAtLeast = 65,
##D               RejectIfWorkerAgreementScoreIsLessThan = 34,
##D               DisregardAssignmentIfRejected = TRUE)
##D policyb <- do.call(GenerateHITReviewPolicy, listb)
##D 
##D # Attach an assignment review policy to a HIT
##D hit1 <- 
##D CreateHIT(title = "Survey",
##D           description = "5 question survey",
##D           reward = ".10",
##D           expiration = seconds(days = 4),
##D           duration = seconds(hours = 1),
##D           keywords = "survey, questionnaire",
##D           hit.review.policy = policyb,
##D           question = GenerateExternalQuestion("http://www.example.com/","400"))
##D 
##D # GetReviewResults
##D GetReviewResultsForHIT(hit1$HITId)
##D 
##D # cleanup
##D ExpireHIT(hit1$HITId)
##D DisposeHIT(hit1$HITId)
## End(Not run)
## Not run: 
##D # Assignment-level ReviewPolicies #
##D 
##D # Example Policy A
##D ## Conditional approval of assignments based on percent of correct answers
##D lista <- list(AnswerKey = list("QuestionId1" = "B",
##D                                "QuestionId2" = "A"),
##D               ApproveIfKnownAnswerScoreIsAtLeast = 99)
##D policya <- do.call(GenerateAssignmentReviewPolicy, lista)
##D 
##D # Example Policy B
##D ## Conditional approval of assignments based on percent of correct answers
##D ## Conditional rejection of assignments based on percent of correct answers
##D listb <- list(AnswerKey = list("QuestionId1" = "B",
##D                                "QuestionId2" = "A"),
##D               ApproveIfKnownAnswerScoreIsAtLeast = 99,
##D               RejectIfKnownAnswerScoreIsLessThan = 1)
##D policyb <- do.call(GenerateAssignmentReviewPolicy, listb)
##D 
##D # Example Policy C
##D ## Conditionally extend HIT with more time and assignments based on score
##D listc <- list(AnswerKey = list("QuestionId1" = "B"),
##D               ExtendIfKnownAnswerScoreIsLessThan = 100,
##D               ExtendMaximumAssignments = 2, # maximum value is 25
##D               ExtendMinimumTimeInSeconds = seconds(hours = 1))
##D policyc <- do.call(GenerateAssignmentReviewPolicy, listc)
##D 
##D 
##D # Attach an assignment review policy to a HIT
##D ## load template file
##D ## applying Policy B will approve if form answers are "Something" and "Yes"
##D ##                        and reject if both are incorrect
##D f <- system.file("templates/htmlquestion3.xml", package = "MTurkR")
##D 
##D hit1 <- 
##D CreateHIT(title = "Survey",
##D           description = "5 question survey",
##D           reward = ".10",
##D           expiration = seconds(days = 4),
##D           duration = seconds(hours = 1),
##D           keywords = "survey, questionnaire",
##D           assignment.review.policy = policyb,
##D           question = GenerateHTMLQuestion(file = f))
##D 
##D # GetReviewResults
##D GetReviewResultsForHIT(hit1$HITId)
##D 
##D # cleanup
##D ExpireHIT(hit1$HITId)
##D DisposeHIT(hit1$HITId)
## End(Not run)
## Not run: 
##D # HIT- and Assignment-level ReviewPolicies
##D 
##D # Example Policy D
##D ## Conditional approval of assignments based on percent of correct answers
##D listd <- list(AnswerKey = list("QuestionId1" = "B",
##D                                "QuestionId2" = "A"),
##D               ApproveIfKnownAnswerScoreIsAtLeast = 99)
##D policyd <- do.call(GenerateAssignmentReviewPolicy, listd)
##D 
##D # Example Policy E
##D ## Conditionally extend HIT based on HIT Agreement Score
##D liste <- list(QuestionIds = c("QuestionId3","QuestionId4","QuestionId5"),
##D               QuestionAgreementThreshold = 65, # at least 2/3rd agreement
##D               ExtendIfHITAgreementScoreIsLessThan = 66,
##D               ExtendMinimumTimeInSeconds = 3600,
##D               ExtendMaximumAssignments = 2,
##D               DisregardAssignmentIfRejected = TRUE)
##D policye <- do.call(GenerateHITReviewPolicy, liste)
##D 
##D ## load template file
##D ## applying 'policya' will approve if form answers are "Something" and "Yes"
##D f <- system.file("templates/htmlquestion3.xml", package = "MTurkR")
##D 
##D # Create HIT
##D hit2 <- 
##D CreateHIT(title = "Survey",
##D           description = "5 question survey",
##D           reward = ".10",
##D           expiration = seconds(days = 4),
##D           duration = seconds(hours = 1),
##D           keywords = "survey, questionnaire",
##D           assignment.review.policy = policyd,
##D           hit.review.policy = policye,
##D           question = GenerateHTMLQuestion(file = f))
##D 
##D # GetReviewResults
##D GetReviewResultsForHIT(hit2$HITId)
##D 
##D # cleanup
##D ExpireHIT(hit2$HITId)
##D DisposeHIT(hit2$HITId)
## End(Not run)



