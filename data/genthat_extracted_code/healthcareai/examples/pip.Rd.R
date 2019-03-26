library(healthcareai)


### Name: pip
### Title: Patient Impact Predictor
### Aliases: pip

### ** Examples

# First, we need a model to make recommendations
set.seed(52760)
m <- machine_learn(pima_diabetes, patient_id, outcome = diabetes,
                   tune = FALSE, models = "xgb")
# Let's look at changes in predicted outcomes for three patients changing their
# weight class, blood glucose, and blood pressure
modifications <- list(weight_class = c("underweight", "normal", "overweight"),
                      plasma_glucose = c(75, 100),
                      diastolic_bp = 70)
pip(model = m, d = pima_diabetes[1:3, ], new_values = modifications)

# In the above example, only the first patient has a positive predicted impact
# from changing their diastolic_bp, so for the other patients fewer than the
# default n=3 predictions are provided. We can get n=3 predictions for each
# patient by specifying allow_same, which will recommend the other two patients
# maintain their current diastolic_bp.
pip(model = m, d = pima_diabetes[1:3, ], new_values = modifications, allow_same = TRUE)

# Sometimes clinical knowledge trumps machine learning. In particular, machine
# learning models don't establish causality, they only leverage correlation.
# Patient impact predictor suggests causality, so clinicians should always be
# consulted to ensure that the causal impacts are medically sound.
#
# If there is clinical knowledge to suggest what impact a variable should have,
# that knowledge can be provided to pip. The way it is provided depends on
# whether the variable is categorical (prohibited_transitions) or numeric
# (variable_direction).

### Constraining categorical variables ###
# Suppose a clinician says that recommending a patient change their weight class
# to underweight from any value except normal is a bad idea. We can disallow
# those suggestions using prohibited_transitions. Note the change in patient
# 1's second recommendation goes from underweight to normal.
prohibit <- data.frame(from = setdiff(unique(pima_diabetes$weight_class), "normal"),
                       to = "underweight")
pip(model = m, d = pima_diabetes[1:3, ], new_values = modifications,
    prohibited_transitions = list(weight_class = prohibit))

### Constraining numeric variables ###
# Suppose a clinician says that increasing diastolic_bp should never be
# recommended to improve diabetes outcomes, and likewise for reducing
# plasma_glucose (which is clinically silly, but provides an illustration). The
# following code ensures that diastolic_bp is only recommended to decrease and
# plasma_glucose is only recommended to increase. Note that the plasma_glucose
# recommendations disappear, because no patient would see their outcomes
# improve by increasing their plasma_glucose.
directional_changes <- c(diastolic_bp = -1, plasma_glucose = 1)
pip(model = m, d = pima_diabetes[1:3, ], new_values = modifications,
    variable_direction = directional_changes)



