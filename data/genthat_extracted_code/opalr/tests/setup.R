#-------------------------------------------------------------------------------
# Copyright (c) 2017 OBiBa. All rights reserved.
#  
# This program and the accompanying materials
# are made available under the terms of the GNU Public License v3.0.
#  
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#-------------------------------------------------------------------------------

#
# Test suite set up
#

library(opalr)
library(testthat)

options(verbose=FALSE)

options(opal.username='administrator', 
        opal.password='password', 
        opal.url='https://opal-demo.obiba.org')

#o <- opal.login()

