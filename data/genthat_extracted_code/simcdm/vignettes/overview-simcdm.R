## ----load-r-pkg----------------------------------------------------------
library(simcdm)

## ----setup-matrix-sims---------------------------------------------------
# Set a seed for reproducibility
set.seed(888)

# Setup Parameters
N = 15   # Number of Examinees / Subjects
J = 10   # Number of Items
K = 2    # Number of Skills / Attributes

## ----sim-q-matrix--------------------------------------------------------
# Set a seed for reproducibility
set.seed(1512)

# Simulate an identifiable Q matrix
Q = sim_q_matrix(J, K)
Q

## ----sim-eta-matrix------------------------------------------------------
# Set a seed for reproducibility
set.seed(4421)

# Simulate an eta matrix
eta = sim_eta_matrix(K, J, Q)
eta

## ----attribute-classes-gen-----------------------------------------------
# Create a listing of all attribute classes 
class_alphas = attribute_classes(K)
class_alphas

## ----sim-subject-attributes----------------------------------------------
# Set a seed for reproducibility
set.seed(5126)

# Create attributes for a subject 
subject_alphas = sim_subject_attributes(N, K)
subject_alphas

# Equivalent to:
# subject_alphas = class_alphas[sample(2 ^ K, N, replace = TRUE),]

## ----setup-sim-dina------------------------------------------------------
# Set a seed for reproducibility
set.seed(888)

# Setup Parameters
N = 15   # Number of Examinees / Subjects
J = 10   # Number of Items
K = 2    # Number of Skills / Attributes

# Assign slipping and guessing values for each item
ss = gs = rep(.2, J)

# Simulate identifiable Q matrix
Q = sim_q_matrix(J, K)

# Simulate subject attributes
subject_alphas = sim_subject_attributes(N, K)

## ----sim-dina-items------------------------------------------------------
# Set a seed for reproducibility
set.seed(2019)

# Simulate items under the DINA model
items_dina = sim_dina_items(subject_alphas, Q, ss, gs)
items_dina

## ----sim-dina-attributes-------------------------------------------------
# Set a seed for reproducibility
set.seed(51823)

# Simulate attributes under the DINA model
attributes = sim_dina_attributes(subject_alphas, Q)
attributes

## ----rrum-sim-setup------------------------------------------------------
# Set a seed for reproducibility
set.seed(888)

# Setup Parameters
N = 15   # Number of Examinees / Subjects
J = 10   # Number of Items
K = 2    # Number of Skills / Attributes

# The probabilities of answering each item correctly for individuals 
# who do not lack any required attribute
pistar = rep(.9, J)

# Simulate an identifiable Q matrix
Q = sim_q_matrix(J, K)

# Penalties for failing to have each of the required attributes
rstar  = .5 * Q

# Latent Class Probabilities
pis = c(.1, .2, .3, .4)

# Generate latent attribute profile with custom probability (N subjects by K skills)
subject_alphas = sim_subject_attributes(N, K, prob = pis)

# Equivalent to:
# class_alphas = attribute_classes(K)
# subject_alphas = class_alphas[sample(2 ^ K, N, replace = TRUE, prob = pis),]

## ----sim-rrum------------------------------------------------------------
# Set a seed for reproducibility
set.seed(912)

# Generate rRUM items
rrum_items = sim_rrum_items(Q, rstar, pistar, subject_alphas)
rrum_items

